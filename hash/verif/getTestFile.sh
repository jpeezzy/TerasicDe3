#!/bin/bash
curl "https://www.random.org/cgi-bin/randbyte?nbytes=64&format=h" -o random_number
python3 getRandomNumber.py 
