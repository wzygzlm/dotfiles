import utf7AndDecryptPwd

nametrans_remote=lambda s: {  '订阅邮件' : 'Subscribed', '已发送' : 'Sent'
                    }.get(s.decode('imap4-utf-7').encode('utf8'), s.decode('imap4-utf-7').encode('utf8'))
print nametrans_remote('&XfJT0ZAB-')


nametrans_local=lambda s: {  'Subscribed' : '订阅邮件',
                             'Web Notice' : '网站通知',
                             'Daily English': '每日英语',
                             'Draft' : '草稿夹',
                             'Starred' : '星标邮件',
                             'Deleted Messages' : '已删除',
                             'Trash' : '垃圾邮件',
                             'Other' : '其它邮件',
                             'Business Info' : '商讯信息',
                             'Sent' : '已发送',
                           }.get(s,s).decode('utf-8').encode('imap4-utf-7')

print nametrans_local('Sent')
