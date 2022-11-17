FROM python:3.8-slim-buster

WORKDIR /src

COPY src/Requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "Exe_1_python.py"]