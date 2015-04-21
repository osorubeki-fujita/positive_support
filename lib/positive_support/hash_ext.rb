# ハッシュ (Hash) のクラスに組み込むモジュール
module PositiveSupport::HashExt

  def sort_keys
    h = ::Hash.new
    self.keys.sort.each do | key |
      h[ key ] = self[ key ]
    end
    h
  end

end