import os
from flask import Flask, jsonify
import psycopg

app = Flask(__name__)

DATABASE_URL = os.environ.get("DATABASE_URL")  

def get_conn():
    if not DATABASE_URL:
        raise RuntimeError("DATABASE_URL env var is not set")
    return psycopg.connect(DATABASE_URL, sslmode="require")

@app.get("/health")
def health():
    return {"status": "ok"}

@app.get("/tables")
def tables():
    conn = get_conn()
    try:
        with conn.cursor() as cur:
            cur.execute("""
                SELECT tablename
                FROM pg_catalog.pg_tables
                WHERE schemaname = 'public'
                ORDER BY tablename;
            """)
            rows = [r[0] for r in cur.fetchall()]
        return jsonify({"tables": rows})
    finally:
        conn.close()
