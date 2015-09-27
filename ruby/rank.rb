class Rank
  def initialize
    @user_val_mapping = Hash.new(0)
  end

  def add(user_id, value)
    @user_val_mapping[user_id] += value
  end

  def max_user
    max_user_id = -1
    max_value = -1
    @user_val_mapping.each_pair do |user_id, value|
      if value > max_value
        max_value = value
        max_user_id = user_id
      end
    end
    max_user_id > 0 ? {max_user_id => max_value} : {}
  end

  def max_users(n)
    max_users = {}
    user_vals = @user_val_mapping.clone
    n.downto(1) do |i|
      max_user_id = max_value = -1
      user_vals.each_pair do |user_id, value|
        if value > max_value
          max_value = value
          max_user_id = user_id
        end
      end
      if max_user_id > 0
        max_users[max_user_id] = max_value
        user_vals.delete(max_user_id)
      end
    end
    max_users
  end
end

