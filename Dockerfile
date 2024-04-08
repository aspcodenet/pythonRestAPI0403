FROM python:alpine

WORKDIR /app


COPY requirements.txt requirements.txt
RUN pip3 install --only-binary :all: greenlet
RUN pip3 install --only-binary :all: MarkupSafe
RUN pip3 install --only-binary :all: Flask-SQLAlchemy
RUN pip3 install --only-binary :all: -r requirements.txt

COPY . .

RUN python3 unittests.py 



EXPOSE 5000

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]