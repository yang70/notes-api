class ItemsController < ApplicationController
  before_action :requires_note
  
  def index
    render json: Item.where(noted: @note )
  end
  
  def create
    new_item = Item.new( item_params )
    
    new_item.note = @note
    
    new_item.save
    
    render json: new_item
  end
  
  def show
    render json: Item.find_by( 
      id: params[ :id ],
      note: @note 
    )
  end
  
  def update
    item = Note.find_by( 
      id: params[ :id ],
      note: @note 
    )
    
    item.assign_attributes( item_params )
    
    item.save
    
    render json: item
  end
  
  def destroy
    item = Note.find_by( 
      id: params[ :id ],
      note: @note 
    )
    
    item.destroy
    
    render json: {}
  end
  
  private
  
  def requires_note
    @note = Note.find_by( id: params[ :note_id ].to_i )
  end
  
  def item_params
    params.require( :item ).permit( :title, :completed_on )
  end
end
  