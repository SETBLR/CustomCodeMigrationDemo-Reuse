class zcl_collection definition
  public
  final
  create public .

  public section.
    class-methods get_collection
      returning
        value(collection) type ref to zcl_collection.
  protected section.
  private section.
endclass.



class zcl_collection implementation.
  method get_collection.
    collection = new zcl_collection( ).
  endmethod.

endclass.
