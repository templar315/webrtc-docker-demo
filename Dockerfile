FROM python:3
ENV PYTHONUNBUFFERED=1
RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y
RUN mkdir /app
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
RUN python manage.py migrate
EXPOSE 8000
ENTRYPOINT ["python", "manage.py", "runserver", "0.0.0.0:8000"]