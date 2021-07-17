FROM ruby:2.7

# Install dependencies
# --------------------
RUN apt-get update -yqq && \
    apt-get install -yqq --no-install-recommends \
    nodejs \
    jq \
    curl \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Install volanty application
# --------------------------
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN gem install bundler --no-document \
 && bundle install --no-binstubs --jobs $(nproc) --retry 3

# Add a script to be executed every time the container starts
# -----------------------------------------------------------
ENTRYPOINT ["./entrypoint.sh"]

# Start the main process
# ----------------------
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
