#!/bin/bash
package=$(helm package chart | sed 's|^Successfully packaged chart and saved it to: ||')
helm push $package oci://registry-1.docker.io/ulevitsky
