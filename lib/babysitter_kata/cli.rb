class BabysitterKata::CLI


  def call
    greet_user
    get_start_time
    time
  end

  def greet_user
    puts 'Welcome'
  end

  def get_start_time
    puts "What time did your babysitting job start?"
  end

  def time

    job = BabysitterKata::Job.new("8pm", "3pm", "1am")
    job.calculate_payment
  end




end
