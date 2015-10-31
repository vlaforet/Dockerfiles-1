#! /bin/bash

mesos-slave --containerizers=docker --master=$MASTER $*
