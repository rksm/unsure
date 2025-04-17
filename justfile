default:
    just --list

setup:
    dart pub get

build:
    dart compile exe \
        -o unsure \
        bin/unsure.dart

pubspec-json:
    yq . pubspec.lock
