class ActiveRecord::Associations::AssociationProxy
  def to_comma(style = :default)
    Comma::Generator.new(self, style).run(:each)
  end
end
