class NotesController < ApplicationController
  def index
    render json: Note.all
  end
  
  def create
    new_note = Note.new( note_params )
    
    new_note.save
    
    render json: {
      id: new_note.id,
      title: new_note.title,
      description: new_note.description
    }
  end
  
  def show
    render json: Note.find_by( id: params[ :id ] ), include: :items
  end
  
  def update
    note = Note.find_by( id: params[ :id ] )
    
    note.assign_attributes( note_params )
    
    note.save
    
    render json: note
  end
  
  def destroy
    note = Note.find_by( id: params[ :id ] )
    
    note.destroy
    
    render json: {}
  end
  
  private
  
  def note_params
    params.require( :note ).permit( :title, :description, :completed_on )
  end
end
  