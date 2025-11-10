#!/usr/bin/env python3

import argparse
import smtplib
import os

from email.message import EmailMessage


def load_credentials():
    credentials = {}
    base = os.path.dirname(os.path.abspath(__file__))
    path = os.path.join(base, ".env")
    with open(path) as env:
        for line in env:
            key, value = line.strip().split('=', 1)
            credentials[key] = value
    return credentials


def send_email(subject, body, smtp_login, smtp_password):
    msg = EmailMessage()
    msg['Subject'] = subject
    msg['From'] = 'nolan.miller77@gmail.com'
    msg['To'] = 'add-to-things-ex0aiy6u6f7howgt407@things.email'
    msg.set_content(body)

    with smtplib.SMTP_SSL('smtp.gmail.com', 465) as smtp:
        smtp.login(smtp_login, smtp_password)
        smtp.send_message(msg)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Add the following text to Things")
    parser.add_argument('todo', help="What do you want to add to things?")
    parser.add_argument(
        '-d',
        '--desc',
        help="This will be added to the description")

    args = parser.parse_args()
    credentials = load_credentials()

    send_email(
        args.todo,
        args.desc or '',
        credentials['GMAIL_ADDRESS'],
        credentials['GMAIL_APP_PASSWORD'])
