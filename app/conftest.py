import logging

import psycopg2
import pytest
from django.db import connections
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

logger = logging.getLogger(__name__)


def run_sql(sql):
    conn = psycopg2.connect(database='postgres', user='postgres',
                            password='postgres', host='host.docker.internal')
    conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
    cur = conn.cursor()
    cur.execute(sql)
    conn.close()


@pytest.fixture(scope='session')
def django_db_setup():
    from django.conf import settings

    settings.DATABASES['default']['NAME'] = 'the_copied_db'
    logger.info(msg="; Started creating test DB...")
    run_sql('DROP DATABASE IF EXISTS the_copied_db')
    run_sql(
            "SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = 'postgres' AND pid <> pg_backend_pid()"
        )
    run_sql('CREATE DATABASE the_copied_db TEMPLATE postgres')
    logger.info(msg="; Creating test DB finished OK")

    yield

    for connection in connections.all():
        connection.close()

    # run_sql('DROP DATABASE the_copied_db')
