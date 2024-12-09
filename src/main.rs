use mysql::prelude::*;
use mysql::*;
use std::fs;
use std::fs::OpenOptions;
use std::io::{self, Write};

fn main() -> Result<()> {
    let mut conn1 = connect("")?;
    execute(&mut conn1, "DROP DATABASE IF EXISTS park", ())?;
    execute(&mut conn1, "CREATE DATABASE park", ())?;
    let mut conn2 = connect("park")?;
    execute_file(&mut conn2, "create_tables.sql", "create_tables_output.txt")?;
    execute_file(&mut conn2, "create_instances.sql", "create_instances_output.txt")?;
    execute_file(&mut conn2, "ask_questions.sql", "ask_questions_output.txt")?;
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

fn execute_file(conn: &mut PooledConn, path: &str, output_path: &str) -> Result<(), mysql::Error> {
    let sql = read_sql_file(path)?;
    let statements: Vec<&str> = sql
        .split(';')
        .map(|stmt| stmt.trim())
        .filter(|stmt| !stmt.is_empty())
        .collect();

    let mut output_file = OpenOptions::new()
        .create(true)
        .write(true)
        .append(true)
        .open(output_path)
        .expect("Unable to open or create output file");

    for statement in statements {
        writeln!(output_file, "Executing statement: {}", statement).expect("Failed to write to output file");
        let response = execute(conn, statement, ())?;
        writeln!(output_file, "Response:\n{}", response).expect("Failed to write to output file");
    }
    Ok(())
}

fn execute(
    conn: &mut PooledConn,
    sql: &str,
    params: impl Into<Params>,
) -> Result<String, mysql::Error> {
    println!("Executing query: {}", sql);
    let result = conn.exec_iter(sql, params)?;
    let mut response = String::new();
    for row_result in result {
        match row_result {
            Ok(row) => {
                println!("Row: {:?}", row);
                response.push_str(&format!("{:?}\n", row));
            }
            Err(e) => {
                println!("Error processing row: {:?}", e);
            }
        }
    }
    println!("Rows affected: {}", conn.affected_rows());
    Ok(response)
}
