FROM python
run pip install --upgrade pip
run pip install flask
run pip install gunicorn
WORKDIR /usr/src/app
RUN mkdir /usr/src/app/templates
RUN mkdir /usr/src/app/static
COPY ./listener.py /usr/src/app/.
COPY ./wsgi.py /usr/src/app/.
COPY ./templates/index.html /usr/src/app/templates/.
COPY ./static/social.png /usr/src/app/static/.
EXPOSE 8000
CMD ["gunicorn"  , "-b", "0.0.0.0:8000", "wsgi:app"]
