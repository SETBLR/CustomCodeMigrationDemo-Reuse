*&---------------------------------------------------------------------*
*& Report  zflight_evaluation_data_gen
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
report zflight_evaluation_data_export line-size 255.


define append_to.
  append &2 to &1.
end-of-definition.

data:
  source type rswsourcet.

select * from zflight_eval into table @data(flight_evals).



append_to source:
  `data evals type standard table of zflight_eval.`,
  `data e type zflight_eval.`.

loop at flight_evals assigning field-symbol(<eval>).
  data(source_line) =
    |e-carrid = '{ <eval>-carrid }'.e-connid = '{ <eval>-connid }'.e-fldate = '{ <eval>-fldate }'.e-bookid = '{ <eval>-bookid }'.e-customid = '{ <eval>-customid }'.| &&
    |e-name = `{ <eval>-name }`.e-meal_rating = { <eval>-meal_rating }.e-flight_rating = { <eval>-flight_rating }.e-service_rating = { <eval>-service_rating }.| &&
    |append e to evals.|.
  append source_line to source.
endloop.
append_to source:
  `delete from zflight_eval.`,
  `insert zflight_eval from table @evals.`.


loop at source assigning field-symbol(<source_line>).
  write: / <source_line>.
endloop.
