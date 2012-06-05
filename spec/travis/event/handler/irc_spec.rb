require 'spec_helper'

describe Travis::Event::Handler::Irc do
  let(:build) { stub('build') }

  before do
    Travis.config.notifications = [:irc]
  end

  describe 'subscription' do
    let(:handler) { Travis::Event::Handler::Irc.any_instance }

    it 'build:started does not call' do
      handler.expects(:call).never
      Travis::Event.dispatch('build:started', build)
    end

    it 'build:finish notifies' do
      handler.expects(:call)
      Travis::Event.dispatch('build:finished', build)
    end
  end
end