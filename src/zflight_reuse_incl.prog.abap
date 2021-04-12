*&---------------------------------------------------------------------*
*&  Include  zflight_reuse_incl
*&---------------------------------------------------------------------*

form do_it.
  data abc type i.
  data cde type i.

  if abc = cde.
    return.
  endif.

endform.
