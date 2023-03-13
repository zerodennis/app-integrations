defmodule NextPayExam.Repo do
  use Ecto.Repo,
    otp_app: :next_pay_exam,
    adapter: Ecto.Adapters.Postgres

  use Scrivener, page_size: 10
end
