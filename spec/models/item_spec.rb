require 'spec_helper'

describe Item do
  it {should belong_to(:todo_list)}
end
