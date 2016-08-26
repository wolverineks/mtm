defmodule Mtm.EnrollmentController do
  use Mtm.Web, :controller

  alias Mtm.Enrollment

  plug :scrub_params, "enrollment" when action in [:create, :update]

  def index(conn, _params) do
    enrollments = Repo.all(Enrollment)
    render(conn, "index.html", enrollments: enrollments)
  end

  def new(conn, _params) do
    changeset = Enrollment.changeset(%Enrollment{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"enrollment" => enrollment_params}) do
    changeset = Enrollment.changeset(%Enrollment{}, enrollment_params)

    case Repo.insert(changeset) do
      {:ok, _enrollment} ->
        conn
        |> put_flash(:info, "Enrollment created successfully.")
        |> redirect(to: enrollment_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    enrollment = Repo.get!(Enrollment, id)
    render(conn, "show.html", enrollment: enrollment)
  end

  def edit(conn, %{"id" => id}) do
    enrollment = Repo.get!(Enrollment, id)
    changeset = Enrollment.changeset(enrollment)
    render(conn, "edit.html", enrollment: enrollment, changeset: changeset)
  end

  def update(conn, %{"id" => id, "enrollment" => enrollment_params}) do
    enrollment = Repo.get!(Enrollment, id)
    changeset = Enrollment.changeset(enrollment, enrollment_params)

    case Repo.update(changeset) do
      {:ok, enrollment} ->
        conn
        |> put_flash(:info, "Enrollment updated successfully.")
        |> redirect(to: enrollment_path(conn, :show, enrollment))
      {:error, changeset} ->
        render(conn, "edit.html", enrollment: enrollment, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    enrollment = Repo.get!(Enrollment, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(enrollment)

    conn
    |> put_flash(:info, "Enrollment deleted successfully.")
    |> redirect(to: enrollment_path(conn, :index))
  end
end
