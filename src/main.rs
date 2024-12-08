use mysql::*;
use mysql::prelude::*;

fn main() -> Result<()> {
    let url = "mysql://root:viu@localhost:3306";
    let pool = Pool::new(url)?;
    let mut conn = pool.get_conn()?;
    let version: Option<String> = conn.query_first("SELECT VERSION()")?;
    println!("MySQL version: {:?}", version);
    Ok(())
}
