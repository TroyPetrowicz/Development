import sqlite3
from sqlite3 import Error


def db_conn(db_file):
    """ create a database connection to the SQLite database
        specified by db_file
    :param db_file: database file
    :return: Connection object or None
    """
    db_conn = None
    try:
        db_conn = sqlite3.connect(db_file)
    except Error as e:
        print("Cannot connect to database")

    return db_conn


def create_project(conn, project):
    """
    Create a new project into the projects table
    :param conn:
    :param project:
    :return: project id
    """
    sql = ''' INSERT INTO projects(name,begin_date,end_date)
            VALUES(?,?,?) '''
    cur = db_conn.cursor()
    cur.execute(sql, project)
    db_conn.commit()
    return cur.lastrowid


def create_task(db_conn, task):
    """
    Create a new task
    :param db_conn:
    :param task:
    :return:
    """

    sql = ''' INSERT INTO tasks(name,priority,status_id,project_id,begin_date,end_date)
            VALUES(?,?,?,?,?,?) '''
    cur = db_conn.cursor()
    cur.execute(sql, task)
    db_conn.commit()
    return cur.lastrowid


def main():
    database = r"E:\SQL\Movie_DB\Movies.db"

    # create a database connection
    db_conn(database)
    with db_conn:
        # create a new project
        project = ('Cool App with SQLite & Python', '2015-01-01', '2015-01-30');
        project_id = create_project(db_conn, project)

        # tasks
        task_1 = ('Analyze the requirements of the app', 1, 1, project_id, '2015-01-01', '2015-01-02')
        task_2 = ('Confirm with user about the top requirements', 1, 1, project_id, '2015-01-03', '2015-01-05')

        # create tasks
        create_task(db_conn, task_1)
        create_task(db_conn, task_2)


if __name__ == '__main__':
    main()