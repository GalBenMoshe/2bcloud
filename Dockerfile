FROM python:3.11-alpine

WORKDIR /app

COPY app/requirements.txt .
RUN pip install -r requirements.txt

COPY /app .

EXPOSE 80
CMD ["python", "main.py"]