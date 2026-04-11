---
name: review-python-code
description: Review python codebase with focus on funcionality, code quality, security, performance, testing and documentation aspects. Use when asked "Review this python code." or "Provide me a code review" or similar
allowed-tools: Read, Grep
model: opus
---

When reviewing the code, focus on:

1. **Funcionality**
	- [ ] Works as intended without caveats or potential offsets from expected behaviour.
    - [ ] Look for unused code paths.

2. **Code Quality**
	- [ ] Follows clean code principles and best practices
	- [ ] Proper error handling and edge cases
	- [ ] Code is readable, maintainable and scalable
	- [ ] Proper logging is implemented, no leftover debug prints are present
	- [ ] Codebase follows python PEP8 style guide.
	- [ ] Codebase follows google style guide for docstrings.

3. **Security**
	- [ ] Check for potential security vulnerabilities
	- [ ] Inputs are sanitized
	- [ ] If authentication/authorization is present: review the logic from security stand point

4. **Performance**
	- [ ] Identify potential performance bottlenecks
	- [ ] If database is present: review the queries for efficiency

5. **Testing**
	- [ ] Verify adequate test coverage
	- [ ] Review test quality and edge cases
	- [ ] Check for missing test scenarios

6. **Documentation**
	- [ ] Ensure main code is properly documented - functions and classes have docstrings and those docstrings are according to the google styleguide (ADD Example?)
	- [ ] Verify README describes the main functionality, installation and documentation as well as some lightweight example
	- [ ] Check documentation accuracy

Review the codebase with in depth focus on previously mentioned aspects.
Prioritize 1. critical bugs, 2. significant improvements or caveats and 3. nitpicks last.
Prioritize 1. end to end level, 2. subsystems level and 3. unit level.
