FROM node:10

ENV SECRET_WORD=TwelveFactor

USER root

#Install git and clone the repo
RUN apt-get update && apt-get install -y git
RUN mkdir /quest
RUN git clone https://github.com/rearc/quest.git /quest

#Set the working directory and install dependencies
WORKDIR /quest
RUN npm install

EXPOSE 3000

#Commands to be executed when the image creates a container.
CMD ["npm", "start"]
