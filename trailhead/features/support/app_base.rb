# this is a base class for all screen classes and WebApp
# it provides functions for screen/page transition
require 'watir-webdriver'


class AppBase

  def await(wait_opts={})

    # self
  end


  def screen(clz)
    clz.new()
  end


  # used to transition from one screen to another
  # return an instance of the screen the app transitions to
  def transition(transition_options={})
    action = transition_options[:action]
    screen_arg = transition_options[:screen]
    should_await = transition_options.has_key?(:await) ? transition_options[:await] : true

    if !action.nil?
      action.call()
    end

    screen_obj = screen_arg.is_a?(Class) ? screen(screen_arg) : screen_arg
    screen_obj ||= self

    if should_await
      wait_opts = transition_options[:wait_options] || {}
      if screen_obj == self
        unless wait_opts.has_key?(:await_animation) && !wait_opts[:await_animation]
          sleep(transition_duration)
        end
      else
        screen_obj.await(wait_opts)
      end
    end

    log("=> #{screen_obj.class.name}")

    screen_obj
  end


end




