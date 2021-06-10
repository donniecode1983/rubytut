#!/bin/bash
rm -fr app/ bin/ config/ db/ lib/ log/ public/ storage/ test/ tmp/ vendor/ .gitignore .ruby-version config.ru Gemfile Gemfile.lock package.json Rakefile README.md

echo "source 'https://rubygems.org'" > Gemfile
echo "gem 'rails', '5.0.0'" >> Gemfile

touch Gemfile.lock
