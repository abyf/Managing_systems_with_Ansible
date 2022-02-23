ansible localhost -m debug -a "msg={{'devops'| password_hash('sha512,'myrandomsalt')}}"
