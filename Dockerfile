# Base image
FROM ruby:2.6.1

# Setup environment variables that will be available to the instance
ENV APP_HOME /notes-api
ENV RAILS_ENV production
ENV DATABASE_URL postgres://notesapi:mypassword@notes-api.cyajbs9g2chm.us-west-2.rds.amazonaws.com
ENV SECRET_KEY_BASE 782845e081ff1ea462be6f6451d11fe019dd485e046f33718b446a7dfe6d0a837b7e37dcedab221ca5f901842a99a1900fae91594fdb98fa91089858c86e1c83

# Installation of dependencies
RUN apt-get update -qq \
  && apt-get install -y \
      # Needed for certain gems
    build-essential \
    # The following are used to trim down the size of the image by removing unneeded data
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf \
    /var/lib/apt \
    /var/lib/dpkg \
    /var/lib/cache \
    /var/lib/log

# Create a directory for our application
# and set it as the working directory
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Add our Gemfile
# and install gems

ADD Gemfile* $APP_HOME/
RUN bundle install

# Copy over our application code
ADD . $APP_HOME

# Run our app
CMD bundle exec rails s -p '3000' -b '0.0.0.0'