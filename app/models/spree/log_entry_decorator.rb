Spree::LogEntry.class_eval do
  def create
    LogEntry.create(log_params)
  end

  private

  def log_params
    params.permit(:details)
  end
end
