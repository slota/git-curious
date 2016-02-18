class Organization
  attr_reader :organizations
  def initialize(current_service)
    @organizations = current_service.organizations
  end
end
