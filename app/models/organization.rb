class Organization
  attr_reader :organizations

  def initialize(current_service, nickname)
    @organizations = current_service.organizations(nickname).map do |organization|
      OrganizationName.new(organization["login"], organization["message"])
    end
  end

  def names
    organizations.map { |org| org.name }
  end
end
