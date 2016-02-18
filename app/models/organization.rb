class Organization
  attr_reader :organizations
  def initialize(current_service)
    @organizations = current_service.organizations
  end

  def names
    organizations.map { |org| org["login"] }
  end
end
