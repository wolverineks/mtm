defmodule Mtm.EnrollmentControllerTest do
  use Mtm.ConnCase

  alias Mtm.Enrollment
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, enrollment_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing enrollments"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, enrollment_path(conn, :new)
    assert html_response(conn, 200) =~ "New enrollment"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, enrollment_path(conn, :create), enrollment: @valid_attrs
    assert redirected_to(conn) == enrollment_path(conn, :index)
    assert Repo.get_by(Enrollment, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, enrollment_path(conn, :create), enrollment: @invalid_attrs
    assert html_response(conn, 200) =~ "New enrollment"
  end

  test "shows chosen resource", %{conn: conn} do
    enrollment = Repo.insert! %Enrollment{}
    conn = get conn, enrollment_path(conn, :show, enrollment)
    assert html_response(conn, 200) =~ "Show enrollment"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, enrollment_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    enrollment = Repo.insert! %Enrollment{}
    conn = get conn, enrollment_path(conn, :edit, enrollment)
    assert html_response(conn, 200) =~ "Edit enrollment"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    enrollment = Repo.insert! %Enrollment{}
    conn = put conn, enrollment_path(conn, :update, enrollment), enrollment: @valid_attrs
    assert redirected_to(conn) == enrollment_path(conn, :show, enrollment)
    assert Repo.get_by(Enrollment, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    enrollment = Repo.insert! %Enrollment{}
    conn = put conn, enrollment_path(conn, :update, enrollment), enrollment: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit enrollment"
  end

  test "deletes chosen resource", %{conn: conn} do
    enrollment = Repo.insert! %Enrollment{}
    conn = delete conn, enrollment_path(conn, :delete, enrollment)
    assert redirected_to(conn) == enrollment_path(conn, :index)
    refute Repo.get(Enrollment, enrollment.id)
  end
end
