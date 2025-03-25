FROM python:3.11-alpine

WORKDIR /app

COPY app/requirements.txt .
RUN pip install -r requirements.txt

COPY . .

EXPOSE 80
CMD ["python", "main.py"]