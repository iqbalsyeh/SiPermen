#!/bin/bash
uvicorn main_3:app --host=0.0.0.0 --port=${PORT:-10000}

