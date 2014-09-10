Custom PostgreSQL sequence
=========





This is a composite sequence created to satisfy a business-process requirement for a customer.


It produces a unique integer consisting of the last 2 digits of the year prepended onto a 6 digit integer.
 
This function is invoked by an after-insert trigger to update a field that previously required human intervention to manage.


Tech
-----------

PostgreSQL 9.3



Usage
-----

SELECT rule2user.get_next_case_num();


License
----

ALl rights reserved. Copyleft where not otherwise specified.



