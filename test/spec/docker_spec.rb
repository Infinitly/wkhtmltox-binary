require 'test_helper'

class DockerSpec < Minitest::Test
  def test_centos_6
    docker_run with: 'centos_6'
  end

  def test_centos_7
    docker_run with: 'centos_7'
  end

  def test_centos_8
    docker_run with: 'centos_8'
  end

  def test_debian_8
    docker_run with: 'debian_8'
  end

  def test_debian_9
    docker_run with: 'debian_9'
  end

  def test_debian_10
    docker_run with: 'debian_10'
  end

  def test_fedora_29
    docker_run with: 'fedora_29'
  end

  def test_fedora_30
    docker_run with: 'fedora_30'
  end

  def test_fedora_31
    docker_run with: 'fedora_31'
  end

  def test_fedora_32
    docker_run with: 'fedora_32'
  end

  def test_fedora_33
    docker_run with: 'fedora_33'
  end

  def test_ubuntu_14_04
    docker_run with: 'ubuntu_14.04'
  end

  def test_ubuntu_16_04
    docker_run with: 'ubuntu_16.04'
  end

  def test_ubuntu_18_04
    docker_run with: 'ubuntu_18.04'
  end

  private

  def docker_run(with:)
    tag_name = "wkhtmltox:#{Wkhtmltox::Binary::VERSION}-#{with}"

    `docker rmi --force #{tag_name} 2>&1 >/dev/null`
    assert_equal `docker build --file .docker/Dockerfile-#{with} --tag #{tag_name} . | grep "Successfully tagged"`.strip, "Successfully tagged #{tag_name}"
    assert_equal `docker run --rm #{tag_name}`.strip, 'wkhtmltopdf 0.12.5 (with patched qt)'
  end
end
