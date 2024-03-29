# Password Validator (:
Password Validator is a bash script that checks the follow requirements for the password:

* Length – minimum of 10 characters.
* Contain both alphabet and number.
* Include both the small and capital case letters.
## Running

expect you to send a password as an argument. it will check if the password was valid or not.

```bash
./password-validator.sh "P@ssworD123"
```

## Usage

```python
./password-validator.sh "P@ssworD123"
"Password is Valid!"
```
By typing a bad password you will get an error message describing the issue.

```python
./password-validator.sh "PrD123"
"Password is too short!"
```
```python
./password-validator.sh "PRRRRRRRRRR13"
"Password does not contain a mix of digits, upper case and lower case letters!"
```

# feature (:
Now it is possible to put the password in a file and check the validity of it with the same requirements.

## Usage

```python
./password-validator.sh -f "password.txt"                                  (P@ssworD123)
"Password is Valid!"
```
By picking a file with a bad password you will get an error message describing the issue.

```python
./password-validator.sh -f "password.txt"                                  (PRRRRRRRRRR13)
"Password does not contain a mix of digits, upper case and lower case letters!"
```


