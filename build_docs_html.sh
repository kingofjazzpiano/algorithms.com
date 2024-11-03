#!/bin/bash

documentation/sphinx_docs/make html
cp -r documentation/sphinx_docs/build/html/* static/documentation/
