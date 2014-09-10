--
-- Jesus Carvalho (jesus.carvalho@gmail.com)
--
-- This is a composite sequence created to satisfy 
-- a business-process requirement for a customer.
-- It produces a unique integer consisting of the last 
-- 2 digits of the year prepended onto a 6 digit integer.
-- 
-- This function is invoked by an after-insert trigger to update
-- a field that previously required human intervention to manage.



-- Function: rule2user.get_next_case_num()

-- DROP FUNCTION rule2user.get_next_case_num();

CREATE OR REPLACE FUNCTION rule2user.get_next_case_num()
  RETURNS character varying AS
$BODY$select right(to_char(current_date, 'YYYY'),2) || 
(select right(nextval('rule2user.pbso_case_num_seq')::varchar,6));
$BODY$
  LANGUAGE sql VOLATILE LEAKPROOF
  COST 100;
ALTER FUNCTION rule2user.get_next_case_num()
  OWNER TO postgres;
COMMENT ON FUNCTION rule2user.get_next_case_num() IS 'prepend the last two digits of the current year onto the last 6 digits of a sequence number that is allowed to cycle.';
