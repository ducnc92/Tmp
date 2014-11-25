#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Zabbix SMTP Alert script.
"""

import sys
import smtplib
from email.MIMEText import MIMEText
from email.Header import Header
from email.Utils import formatdate

# Mail Account
MAIL_ACCOUNT = 'zabbixalert@your.domain.com'
MAIL_PASSWORD = 'yourpasswordhere'

# Mail Server
SMTP_SERVER = 'smtp.your.domain.com'
SMTP_PORT = 25
Check = True

def send_mail(recipient, subject, body, encoding='utf-8'):
    session = None
    msg = MIMEText(body, 'plain', encoding)
    msg['Subject'] = Header(subject, encoding)
    msg['To'] = recipient
    msg['Date'] = formatdate()
    try:
        session = smtplib.SMTP(SMTP_SERVER, SMTP_PORT)
        if Check:
            session.ehlo()
            session.login(MAIL_ACCOUNT, MAIL_PASSWORD)
        session.sendmail(MAIL_ACCOUNT, recipient, msg.as_string())
    except Exception as e:
        raise e
    finally:
        if session:
            session.quit()

#send_mail("nguyencongduc3112@gmail.com","Test with python","Email nhận được ổn cả chứ anh?")
#send_mail("congtt@vdc.com.vn","Test with python","Email nhận được ổn cả chứ anh?")


if __name__ == '__main__':
    """
    recipient = sys.argv[1]
    subject = sys.argv[2]
    body = sys.argv[3]
    """
    if len(sys.argv) == 4:
        send_mail(
            recipient=sys.argv[1],
            subject=sys.argv[2],
            body=sys.argv[3])
    else:
        print u"""requires 3 parameters (recipient, subject, body)
\t$ zabbix-gmail.sh recipient subject body
"""
