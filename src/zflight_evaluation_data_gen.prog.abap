*&---------------------------------------------------------------------*
*& Report  zflight_evaluation_data_gen
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
report zflight_evaluation_data_gen.

data wa_sflight type sflight.

data(random_int) = cl_abap_random_int=>create(
                       min            = 0
                       max            = 5          ).

data it_eval type standard table of zflight_eval.
field-symbols <eval> type zflight_eval.

select * from sflight into wa_sflight where carrid = 'LH'.

  clear it_eval.
  select booking~carrid booking~connid booking~fldate booking~bookid booking~customid customer~name
    from sbook as booking join scustom as customer on customer~id = booking~customid

    into corresponding fields of table it_eval
     where booking~carrid = wa_sflight-carrid
       and booking~connid = wa_sflight-connid
       and booking~fldate = wa_sflight-fldate.

  loop at it_eval assigning <eval>.
    <eval>-flight_rating = random_int->get_next( ).
    <eval>-service_rating = random_int->get_next( ).
    <eval>-meal_rating = random_int->get_next( ).
  endloop.

  modify zflight_eval from table it_eval.

endselect.
