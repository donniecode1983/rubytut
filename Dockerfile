# syntax=docker/dockerfile:1
FROM ruby:2.5.0
RUN apt-get update -qq && apt-get install -y sudo apt-utils build-essential libpq-dev
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle update && bundle install
ADD . /myapp
# Install NodeJs and Yarn
RUN chmod +x install_node.sh && ./install_node.sh && npm install --global yarn
# Configure Webpacker
RUN rails webpacker:install && yarn install --check-files

# Add a script to be executed every time the container starts.
# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]
# EXPOSE 3000

# Configure the main process to run when running the image
# CMD ["rails", "server", "-b", "0.0.0.0"]