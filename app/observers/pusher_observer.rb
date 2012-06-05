class PusherObserver < ActiveRecord::Observer
  observe :message

  def after_create(rec)
    publish(:create, rec)
  end
  
  # def after_update(rec)
  #   publish(:update, rec)
  # end
  
  # def after_destroy(rec)
  #   publish(:destroy, rec)
  # end
  
  protected

  def publish(type, rec)
    Pusher['testing'].trigger!(
      type, 
      {
        id:   rec.id,
        class:  rec.class.name,
        record: rec
      }
    )
  end
end
