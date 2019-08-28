#!/bin/bash
OPENAPI_FILE=https://raw.githubusercontent.com/openapitools/openapi-generator/master/modules/openapi-generator/src/test/resources/2_0/petstore.yaml
STUB_FRAMEWORK=go-server
TEST_FRAMEWORK=go
#RUBY_FRAMEWORK=ruby
docker pull openapitools/openapi-generator-cli
docker run --rm -v ${PWD}:/local openapitools/openapi-generator-cli generate \
    -i $OPENAPI_FILE \
    -g $STUB_FRAMEWORK \
    -o /local/out/$STUB_FRAMEWORK
docker run --rm -v ${PWD}:/local openapitools/openapi-generator-cli generate \
    -i $OPENAPI_FILE \
    -g $TEST_FRAMEWORK \
    -o /local/out/$TEST_FRAMEWORK
#docker run --rm -v ${PWD}:/local openapitools/openapi-generator-cli generate \
    #-i $OPENAPI_FILE \
    #-g $RUBY_FRAMEWORK \
    #-o /local/out/$RUBY_FRAMEWORK
