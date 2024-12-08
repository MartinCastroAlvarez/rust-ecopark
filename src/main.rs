use mysql::prelude::*;
use mysql::*;
use std::fs;
use std::io;

fn main() -> Result<()> {
    let mut conn1 = connect("")?;
    execute(&mut conn1, "DROP DATABASE IF EXISTS park", ())?;
    execute(&mut conn1, "CREATE DATABASE park", ())?;
    let mut conn2 = connect("park")?;
    execute_file(&mut conn2, "create_tables.sql")?;
    execute_file(&mut conn2, "create_instances.sql")?;
    Ok(())
}

fn connect(database: &str) -> Result<PooledConn, mysql::Error> {
    let url = if database.is_empty() {
        "mysql://root:viu@localhost:3306".to_string()
    } else {
        format!("mysql://root:viu@localhost:3306/{}", database)
    };
    let pool = Pool::new(Opts::from_url(&url)?)?;
    let conn = pool.get_conn()?;
    Ok(conn)
}

fn read_sql_file(path: &str) -> io::Result<String> {
    fs::read_to_string(path)
}

fn execute(
    conn: &mut PooledConn,
    sql: &str,
    params: impl Into<Params>,
) -> Result<(), mysql::Error> {
    println!("Executing query: {}", sql);
    let mut result = conn.exec_iter(sql, params)?;
    if let Some(Ok(_row)) = result.next() {
        println!("Query result:");
        for row_result in result {
            let row: Row = row_result?;
            println!("{:?}", row);
        }
    } else {
        println!("Rows affected: {}", result.affected_rows());
    }
    Ok(())
}

fn execute_file(conn: &mut PooledConn, path: &str) -> Result<(), mysql::Error> {
    let sql = read_sql_file(path)?;
    let statements: Vec<&str> = sql
        .split(';')
        .map(|stmt| stmt.trim())
        .filter(|stmt| !stmt.is_empty())
        .collect();
    for statement in statements {
        println!("Executing statement: {}", statement);
        execute(conn, statement, ())?;
    }
    Ok(())
}