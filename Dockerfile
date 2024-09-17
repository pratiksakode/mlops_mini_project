FROM python:3.10

WORKDIR /app

COPY  ./flask_app/ /app/

COPY models/vectorizer.pkl /app/flask_app/models/vectorizer.pkl

RUN pip3 install -r requirements.txt

RUN python -m nltk.downloader stopwords wordnet

EXPOSE 5000

#CMD [ "python", "-m" ,"flask", "run", "--host=0.0.0.0" ]
CMD ["gunicorn", "-b", "0.0.0.0:5000", "flask_app.app:app"]