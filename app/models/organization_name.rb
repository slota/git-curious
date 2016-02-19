class OrganizationName
  attr_reader :org_name, :error_message

  def initialize(org_name, error_message)
    @org_name = org_name
    @error_message = error_message
  end

  def name
    org_name
  end
end
